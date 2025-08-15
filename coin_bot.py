import os
import random
from telegram import Update
from telegram.ext import ApplicationBuilder, CommandHandler, ContextTypes

TOKEN = os.environ.get("BOT_TOKEN")

async def start(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    await update.message.reply_text("Привет! Используй /coin чтобы подбросить монету.")

async def coin(update: Update, context: ContextTypes.DEFAULT_TYPE) -> None:
    result = random.choice(["орёл", "решка"])
    await update.message.reply_text(result)

def main() -> None:
    if not TOKEN:
        raise RuntimeError("BOT_TOKEN environment variable not set")
    app = ApplicationBuilder().token(TOKEN).build()
    app.add_handler(CommandHandler("start", start))
    app.add_handler(CommandHandler("coin", coin))
    app.run_polling()

if __name__ == "__main__":
    main()
